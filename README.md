[![motionLight Demo Video](/demo/motionLight_5.png)](https://www.youtube.com/watch?v=OAWRhbDooVY)

# motionLight

<br><br><br>

MotionLight is an live interactive visual audio installation of my personal interest on generating intriguing visual work by manipulating pixels from 2D images. It includes six different interactive modes, reading information from laptop’s camera and microphone, by detecting light difference and motion, it generates various playable effects.

### EXPOSITION
With careful design in aligning light bulbs, LEDs, and accompany them with suitable content to play on each artwork, Jim Campbell’s custom electronics expressed actions and movements in a concise but vivid manner. However, it is often static, or non-interactive.

Inspired by Jim Campbell’s low resolution artwork series, this webcam live interactive work MotionLight expands on the idea of pixelated art to time and space interpolation, bring more fun to simple binary visual effect by light bulbs and LEDs.

### IMPLEMENTATION
Coded with Processing, without using any external libraries. I process the image from the webcam to generation six different visual effects.

The simplest effect is a binary conversion from the input images’ brightness. To make the simple demo more playable. It also reads the audio level from the microphone to actively adjust the size of the pixel that match with the beats of the input music.

Next I take it further to generate binary image by implementing ‘motion detection’. Using a simple but efficient algorithm to detect pixel differences between frames to mark the movements in from the camera.

Once I have reliable binary information of the subject, I wrote a time tunnel that saves previous frames for future manipulation. From this array of image we can generation a series of continuous live-like movements that combines with random color, varying refresh rates and tunnel-like visual effects.

It is designed to be an playable installation for public space.

### CODE
https://github.com/cy-xu/motionLight

### REFERENCES
[1]  WHITE CIRCLE 2001 – Jim Campbell
[2]  The Coding Train – Daniel Shiffma
