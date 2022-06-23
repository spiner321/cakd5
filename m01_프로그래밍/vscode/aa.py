
import numpy as np

while(1):
    s_e=input("게임을 하시겠습니까?[y/n]: ")

    if(s_e=="y"):
        anser= np.random.randint(0,10)
        while(a != anser):
            a=int(input("숫자를 입력하세요(0~10): "))
            if(a>anser):
                print("down")
            elif(a<anser):
                print("up")
            else:
                print("범위 안의 숫자를 입력해주세요.")
        print("정답입니다.")
    else:
        print("게임을 종료합니다.")
        break
