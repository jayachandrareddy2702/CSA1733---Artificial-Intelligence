import itertools

def solve_cryptarithm():
    letters = 'SCOBYDLINK'
    

    for perm in itertools.permutations(range(10), len(letters)):
        mapping = dict(zip(letters, perm))
        
        SCOOBY = mapping['S'] * 100000 + mapping['C'] * 10000 + mapping['O'] * 1000 + mapping['O'] * 100 + mapping['B'] * 10 + mapping['Y']
        DOOO = mapping['D'] * 1000 + mapping['O'] * 100 + mapping['O'] * 10 + mapping['O']
        BLINKS = mapping['B'] * 100000 + mapping['L'] * 10000 + mapping['I'] * 1000 + mapping['N'] * 100 + mapping['K'] * 10 + mapping['S']
        
        if SCOOBY + DOOO == BLINKS:
            print(f"SCOOBY: {SCOOBY}, DOOO: {DOOO}, BLINKS: {BLINKS}")
            print(f"Mapping: {mapping}")
            return mapping

solve_cryptarithm()
