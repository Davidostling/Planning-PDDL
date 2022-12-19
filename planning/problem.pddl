(define (problem festival) ; the problem name
(:domain tavern) ; the domain in which the problem takes place
(:objects ; the objects in the problem
    ; reserved parties
    livingstone
    the_fellowship
    ; drop in parties
    p1
    p2
    ; rooms
    suite
    deluxe
    ; sizes
    small
    large
    ;
    thursday
    friday
    saturday
)
(:init ; the initial world state
    ; the parties
    (party livingstone) (party the_fellowship)
    (party p1) (party p2)
    ; the rooms
    (room suite) (room deluxe)
    ; the sizes
    (size small) (size large)
    ; the days
    (day thursday) (day friday) (day saturday)
    ; the reservations
    (has_reservation livingstone suite friday) (has_reservation livingstone suite saturday)
    (has_reservation the_fellowship deluxe saturday)
    ; the drop in party sizes
    (is_size p1 small) (is_size p2 large) 
    ; the room sizes
    (is_size suite small) 
    (is_size deluxe large)
    ; the size structure
    (fits small small) (fits small large)
    (fits large large)
    ; thursday is the current day
    (is_current_day thursday)
    ; the day order
    (is_next_day thursday friday) (is_next_day friday saturday)
    ; the rooms are empty and clean
    (is_vacant suite) (is_clean suite) 
    (is_vacant deluxe) (is_clean deluxe)
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
