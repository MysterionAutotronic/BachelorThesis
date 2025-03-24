import copy

words = []

original_words = copy.deepcopy(words)
last_element_before_sort = original_words[-1]
words.sort()
for word in words:
    if word == last_element_before_sort:
        print(f"\033[91m{word}\033[0m", end=" ")
    else:
        print(word, end=" ")
print()
