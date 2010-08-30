/*
 * FLINT PARTICLE SYSTEM
 * .....................
 * 
 * Author: Richard Lord
 * Copyright (c) Richard Lord 2008-2010
 * http://flintparticles.org/
 * 
 * Licence Agreement
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package
{
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.counters.Blast;
	import org.flintparticles.common.energyEasing.Quadratic;
	import org.flintparticles.common.initializers.ColorInit;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.twoD.actions.TweenToZone;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.twoD.zones.BitmapDataZone;

	import flash.display.Bitmap;

	public class FirstEmitter extends Emitter2D
	{
		[Embed(source="assets/flint.png")]
		public var FlintImage:Class;

		[Embed(source="assets/particles.png")]
		public var ParticlesImage:Class;

		public function FirstEmitter()
		{
			var flintBitmap:Bitmap = new FlintImage();
			var particlesBitmap:Bitmap = new ParticlesImage();
			
			counter = new Blast( 3000 );
			
			addInitializer( new ColorInit( 0xFFFFFF00, 0xCC6600 ) );
			addInitializer( new Lifetime( 6 ) );
			addInitializer( new Position( new BitmapDataZone( flintBitmap.bitmapData, 40, 60 ) ) );
			
			addAction( new Age( Quadratic.easeInOut ) );
			addAction( new TweenToZone( new BitmapDataZone( particlesBitmap.bitmapData, 40, 60 ) ) );
		}
	}
}