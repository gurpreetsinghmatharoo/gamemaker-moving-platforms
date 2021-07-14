/// @description 
// Horizontal movement
moveX = inputX * moveSpeed;

// Jump
if (inputJump && place_meeting(x, y + 1, oPlatformParent)) {
	moveY = -jumpSpeed;
}

// Final movement velocity
var _finalMoveX = moveX;
var _finalMoveY = moveY;

// Moving platform collision
var _movingPlatform = instance_place(x, y + max(1, _finalMoveY), oPlatformMoving);
if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top) {
	// Pixel-perfect collisions
	if (_finalMoveY > 0) {
		while (!place_meeting(x, y + sign(_finalMoveY), oPlatformMoving)) {
			y += sign(_finalMoveY);
		}
	
		_finalMoveY = 0;
		moveY = 0; // So the gravity is reset too
	}
	
	// Add velocity
	_finalMoveX += _movingPlatform.moveX;
	_finalMoveY += _movingPlatform.moveY;
}

/// Platform collisions
// X
if (place_meeting(x + _finalMoveX, y, oPlatform)) {
	while (!place_meeting(x + sign(_finalMoveX), y, oPlatform)) {
		x += sign(_finalMoveX);
	}
	
	_finalMoveX = 0;
}

// Y
if (place_meeting(x, y + _finalMoveY, oPlatform)) {
	while (!place_meeting(x, y + sign(_finalMoveY), oPlatform)) {
		y += sign(_finalMoveY);
	}
	
	_finalMoveY = 0;
	moveY = 0; // So the gravity is reset too
}

// Move
x += _finalMoveX;
y += _finalMoveY;

// Gravity
if (moveY < 10) {
	moveY += gravSpeed;
}