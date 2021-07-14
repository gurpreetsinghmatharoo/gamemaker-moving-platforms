/// @description 
// Sprite
if (moveY < 0) {
	sprite_index = sPlayer_Jump;
}
else if (inputX != 0) {
	image_xscale = sign(inputX);
	sprite_index = sPlayer_Walk;
}
else {
	sprite_index = sPlayer_Idle;
}