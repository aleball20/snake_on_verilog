

module wrapper_snake_game(collision_detected, clock_25, right_sync, left_sync, right_register, left_register, right, left, down, up, game_tik ,current_state, next_state, frame_tik, right_P, left_P, snake_head_x, snake_head_y, snake_body_x, 
                            snake_body_y, fruit_x, fruit_y, snake_length, score, display_area, VGA_HS, VGA_VS, reset, X, Y);

parameter PIXEL_DISPLAY_BIT = 9;									 

input clock_25, reset;
input right_P, left_P;

output[PIXEL_DISPLAY_BIT:0] X,Y; 
output [6:0] snake_head_x, snake_head_y, snake_body_x, snake_body_y, fruit_x, fruit_y;
output [3:0] snake_length;
output VGA_HS, VGA_VS;
output frame_tik; 
output game_tik;
output display_area;
output collision_detected;
output [7:0] score;   
output [2:0] current_state, next_state;
output right, left, up, down, right_sync, left_sync, right_register, left_register;

wire body_count;

snake_game_fsm_for_test my_snake_game_fsm_for_test(
    .clock_25(clock_25),
    .reset(reset),
	.frame_tik(frame_tik),
    .game_tik(game_tik),
    .right_P(right_P),
    .left_P(left_P),
    .snake_head_x(snake_head_x), 
    .snake_head_y(snake_head_y),
    .snake_body_x(snake_body_x),
    .snake_body_y(snake_body_y),
    .fruit_x(fruit_x),
    .fruit_y(fruit_y),
    .snake_length(snake_length),
    .score(score),
    .current_state(current_state),
    .collision_detected(collision_detected),
	 .body_count(body_count),
    .right(right),
    .left(left),
    .up(up),
    .down(down),
	 .right_sync(right_sync),
	 .left_sync(left_sync),
	 .right_register(right_register),
	 .left_register(left_register),
    .next_state(next_state)
);

vga_tracker my_vga_tracker(
    .display_area(display_area),
    .clock_25(clock_25),
	.frame_tik(frame_tik),
    .h_sync(VGA_HS),
    .v_sync(VGA_VS),
    .reset(reset),
    .X(X),
    .Y(Y)
);


game_delay my_game_delay(
    .clock_25(clock_25),
    .reset(reset),
    .frame_tik(frame_tik),
    .game_tik(game_tik)
);


endmodule