
import requests as req
import re
from requests.exceptions import ConnectionError

"""
download m3u8.playlist
"""


def __get_m3u8(url: str):
    res_lines = req.get(url).content.decode('utf-8').splitlines()
    index = __get_index(res_lines)
    playlist = res_lines[index:]
    pure_playlist = list()
    for __video_url in playlist:
        if re.search("#EXTINF", string=__video_url):
            continue
        if re.search("#EXT-X-ENDLIST", string=__video_url):
            continue
        pure_playlist.append(__video_url)
    return pure_playlist


def __get_index(lines: list):
    for i in range(0, lines.__len__()):
        if re.search(pattern="#EXTINF", string=lines[i]):
            return i


def __get_content(url: str):
    res = req.request(
        method='get', url=url)
    print(res.status_code)
    if res.ok:
        __content = res.content
        res.close()
        return __content
    else:
        return None


def download(name: str, m3u8_url: str, default_type='mp4'):
    fp = open('{}.{}'.format(name, default_type), 'wb')
    __play_list = __get_m3u8(m3u8_url)

    print("playlist total length %s" % __play_list.__len__())
    for __play_list_v in __play_list:
        print(__play_list_v)

    for __play_list_index in range(0, __play_list.__len__()):
        content = None
        if __play_list[__play_list_index].startswith("http"):
            print("download {}".format(__play_list_index))
            flag = 0
            while flag < 5:
                try:
                    content = __get_content(__play_list[__play_list_index])
                    break
                except ConnectionError:
                    flag += 1
                    print("retry {}".format(flag))
        if content:
            fp.write(content)
    fp.close()


if __name__ == "__main__":
    download(
        name="test",
        m3u8_url="http*.m3u8"
    )