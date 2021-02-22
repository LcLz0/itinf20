#!/usr/bin/env python3

from numpy import median

amount_people = input("How many people would you like to enter into the database? ")
people_dict = dict()    # List of persons

# Indexvars for searching in values
age_index = 0
shoe_index = 1

# Static dict for testing/troubleshooting
# people_dict.update({"Fille" : [31, 49]})
# people_dict.update({"Emma" : [29, 41]})
# people_dict.update({"Kingves": [30, 45]})

# Populate dict with input. Value is a list, [0] = age, [1] = shoe
for i in range(int(amount_people)):
    print(f"\nEnter info for person {i+1}\n")
    name = str.title(input("Enter your name: "))
    age = int(input("Enter your age: "))
    shoesize = int(input("Enter your shoe size: "))
    pop_list = [age, shoesize]
    # Enter info to dict
    people_dict.update({name : pop_list})

##### Begin sortblock #####

# Temporary list for some sorting
tmp_age = list()
tmp_shoe = list()
# Populate variables with max age, med shoe and store in vars
for name in people_dict:
    tmp_age.append(list(people_dict[name])[age_index])
for name in people_dict:
    tmp_shoe.append(list(people_dict[name])[shoe_index])

max_age = max(tmp_age)
med_shoe = int(median(tmp_shoe))

# Check for max age, print name if found
for name in people_dict:
    if max_age in people_dict[name]:
        print(f"\n{name} is the oldest at {max_age}!")

for name in people_dict:
    if med_shoe in people_dict[name]:
        print(f"\n{name} has the median shoesize, at size {med_shoe}")

##### Begin searchblock #####

print("\nEnter something to search for in database. Format is: <datatype> <value>")
print("Valid datatypes are: Name, Age or Size\n")
choice = input("Enter values: ")
print("")
space_loc = choice.find(" ")
choice_type = choice[0:space_loc]
choice_value = choice[space_loc+1:]


if "age" in choice.lower():
    for name in people_dict:
        tmp_list = list(people_dict[name])
        if choice_value in str(tmp_list[age_index]):
            print("Person found!")
            print(f"Name: {name}\nAge: {tmp_list[age_index]}\nSize: {tmp_list[shoe_index]}")
        else:
            print("Person not found!")

if "size" in choice.lower():
    for name in people_dict:
        tmp_list = list(people_dict[name])
        if choice_value in str(tmp_list[shoe_index]):
            print("Person found!")
            print(f"Name: {name}\nAge: {tmp_list[age_index]}\nSize: {tmp_list[shoe_index]}")
        else:
            print("Person not found!")

if "name" in choice.lower():
    if choice_value.title() in people_dict:
        tmp_list= list(people_dict[choice_value.title()])
        print("Person found!")
        print(f"Name: {choice_value.title()}\nAge: {tmp_list[age_index]}\nSize: {tmp_list[shoe_index]}")
    else:
        print("Person not found!")
