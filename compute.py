"""
假设员工A 每天工资50000；
工资每天的涨幅是0.05
节假日不涨工资
"""
__base = 50000
__income_sum = __base

__month_sum = 5
__days_sum = __month_sum * 4 * 5
for day in range(1, __days_sum + 1):
    __income_sum = __income_sum * (0.05 + 1)
    print("第{}天:  {}".format(day, __income_sum))







