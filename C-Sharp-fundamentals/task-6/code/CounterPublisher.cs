// CounterPublisher.cs

using System;

namespace EventDemo
{
    // Delegate Declaration
    public delegate void ThresholdReachedHandler(object sender, ThresholdReachedEventArgs e);

    // Custom EventArgs to pass event data
    public class ThresholdReachedEventArgs(int threshold, DateTime timeReached) : EventArgs
    {
        public int Threshold { get; } = threshold;
        public DateTime TimeReached { get; } = timeReached;
    }

    // Producer (or) Publisher class
    class CounterPublisher(int threshold)
    {
        private int _count = 0;
        private int _threshold = threshold;

        // Event triggered when threshold is reached
        public event ThresholdReachedHandler? ThresholdReached;

        public void Increment() {
            _count++;
            Console.WriteLine($"Counter: {_count}");

            if(_count == _threshold){
                OnThresholdReached();
            }

        }

        protected virtual void OnThresholdReached(){
            Console.WriteLine($"\n[Publisher] Threshold {_threshold} reached. Raising event...📢");
            ThresholdReached?.Invoke(this, new ThresholdReachedEventArgs(_threshold, DateTime.Now));
        }
    }
}
