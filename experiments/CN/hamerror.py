def get_red_bits_array(hamcode):
    i=0
    arr=[]
    while pow(2,i)<=len(hamcode):
        arr.append(pow(2,i))
        i=i+1
    return arr

def get_set_of_bits(n,e):
    arr=[]
    for i in range(n+1,e+1):
        if i&n!=0:
            arr.append(i)
    return arr


def get_parity(indexes,hamcode):
    one=0
    for i in range(0,len(indexes)):
        if hamcode[indexes[i]-1]=='1':
            one=one+1
    if one%2==0:
        return 0
    return 1

            

def check_err(sets,hamcode):
    ans=[]
    for i in range(0,len(sets)):
        ans.append(get_parity(sets[i],hamcode))
    s=0

    for i in range(0,len(ans)):
        s=s+pow(2,i)*ans[i]

    return s
            


if __name__=="__main__":
    print("This is Code for Hamming Code Error Detection and Correction: ")
    
    hamcode=list(input("Enter Hamming Code  : "))

    hamcode.reverse()

    
    red_arr=get_red_bits_array(hamcode)

    sets=[]
        
    i=0
    while i<len(red_arr):
        
        ans=get_set_of_bits(red_arr[i],len(hamcode))
        ans=[red_arr[i]]+ans
        sets.append(ans)
        i=i+1

    
    #print(sets)

    solution_index=check_err(sets,hamcode)

    if solution_index==0:
        print("ERRORLESS HAMMING CODE")
    else:
        print("ERROR FOUND AT : ", solution_index)
        soltn='1'
        if bool(not int(hamcode[solution_index-1]))==False:
            soltn='0'
            
        hamcode[solution_index-1]=soltn
        #hamcode.reverse()
        print("CORRECT HAMMING CODE IS : ",hamcode)

"""
This is Code for Hamming Code Error Detection and Correction: 
Enter Hamming Code  : 10011100101
ERRORLESS HAMMING CODE


"""
    
    
