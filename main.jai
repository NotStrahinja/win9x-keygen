#import "Basic";
#import "Random";

gen_retail :: (state: *Random_State) {
    rand_3: int;
    while true {
        rand_3 = cast(int) random_get_within_range(state, 100, 999);
        if rand_3 % 111 != 0 {
            break;
        }
    }
    rand_7: [7] int;
    while true {
        sum := 0;
        for 0..6 {
            rand_7[it] = cast(int) random_get_within_range(state, 0, 10);
            sum += rand_7[it];
        }
        if sum % 7 == 0 {
            break;
        }
    }
    print("Your CD Retail key: %-", rand_3);
    for 0..6 {
        print("%", rand_7[it]);
    }
    print("\n");
}

gen_oem :: (state: *Random_State) {
    rand_day := cast(int) random_get_within_range(state, 1, 367);
    rand_year := cast(int) random_get_within_range(state, 0, 9);
    year_list :: int.[95, 96, 97, 98, 99, 0, 1, 2];
    rand_6: [6]int;
    while true {
        sum := 0;
        for 0..5 {
            rand_6[it] = cast(int) random_get_within_range(state, 0, 10);
            sum += rand_6[it];
        }
        if sum % 7 == 0 {
            break;
        }
    }
    rand_5: [5]int;
    for 0..4 {
        rand_5[it] = cast(int) random_get_within_range(state, 0, 10);
    }
    print("Your OEM key: %%-OEM-0", formatInt(rand_day, minimum_digits = 3), formatInt(year_list[rand_year], minimum_digits = 2));
    for 0..5 {
        print("%", rand_6[it]);
    }
    print("-");
    for 0..4 {
        print("%", rand_5[it]);
    }
    print("\n");
}

main :: () {
    state: Random_State;
    random_seed(*state, current_time_monotonic().low);
    gen_retail(*state);
    gen_oem(*state);
}
