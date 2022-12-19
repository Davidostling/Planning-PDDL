(define (problem festival) ; the problem name
(:domain tavern) ; the domain in which the problem takes place
(:objects ; the objects in the problem
    ; reserved parties
    livingstone
    the_fellowship
    mardi_gras
    friends
    vox_machina
    ; drop in parties
    p1
    p2
    p3
    p4
    p5
    ; rooms
    suite
    deluxe
    cellar
    regular
    ; sizes
    small
    medium
    large
    ;
    thursday
    friday
    saturday
    sunday
)
(:init ; the initial world state
    ; the parties
    (party livingstone) (party the_fellowship) (party mardi_gras) (party friends) (party vox_machina) (party kebab_lovers) (party taco_lovers) (party pizza_dudes) (party burger_dudes) 
    (party p1) (party p2) (party p3) (party p4) (party p5) (party p6) (party p7) (party p8) (party p9)
    ; the rooms
    (room suite) (room deluxe) (room cellar) (room regular)
    ; the sizes
    (size small) (size medium) (size large) 
    ; the days
    (day thursday) (day friday) (day saturday) (day sunday)
    ; the reservations
    (has_reservation livingstone suite thursday) (has_reservation livingstone suite friday) (has_reservation livingstone suite saturday)
    (has_reservation the_fellowship deluxe saturday)
    (has_reservation kebab_lovers suite sunday)
    (has_reservation taco_lovers cellar thursday) (has_reservation taco_lovers cellar sunday)
    (has_reservation pizza_dudes regular thursday) (has_reservation pizza_dudes regular friday) (has_reservation pizza_dudes regular sunday)
    (has_reservation burger_dudes deluxe thursday) (has_reservation burger_dudes deluxe sunday)


    ; the drop in party sizes
    (is_size p1 small) (is_size p2 large) (is_size p3 medium) (is_size p4 medium) (is_size p5 large) (is_size p6 small) (is_size p7 medium) (is_size p8 medium) (is_size p9 large)
    ; the room sizes
    (is_size suite small) 
    (is_size deluxe large)
    (is_size cellar medium)
    (is_size regular medium)
    ; the size structure
    (fits small small) (fits small large) (fits large large) (fits medium large) fits(medium medium) fits(small medium)
    ; thursday is the current day
    (is_current_day thursday)
    ; the day order
    (is_next_day thursday friday) (is_next_day friday saturday) (is_next_day saturday sunday)
    ; the rooms are empty and clean
    (is_vacant suite) (is_clean suite) 
    (is_vacant deluxe) (is_clean deluxe)
    (is_vacant cellar) (is_clean cellar)
    (is_vacant regular) (is_clean regular)
)
(:goal ; the end goals
    ; all rooms are booked each day
    ; the parties with reservations were booked accordingly
    (and
        (has_booked_room suite thursday) (has_booked_room deluxe thursday)
        (has_booked_room suite friday) (has_booked_room deluxe friday)
        (has_booked_room suite saturday) (has_booked_room deluxe saturday)
        
        (has_booked_party livingstone friday) (has_booked_party livingstone saturday)
        (has_booked_party the_fellowship saturday)
    )
)
)
