using System;

namespace DevAutomation
{
    public static class DeveloperTasks
    {
        [Runnable("Performs the system tests.")]
        public static void GenerateReport()
        {
            Console.WriteLine("📄 All tests passed.");
        }

        [Runnable("Performs the system health check.")]
        public static void PerformHealthCheck()
        {
            Console.WriteLine("💻 Health Check: Nominal (CPU 34%, Memory 65%, Disk 70%).");

        }

        [Runnable("Sends summary email to the team.")]
        public static void SendSummaryMail()
        {
            Console.WriteLine("📧 Summary Email sent to admin@company.com.");
        }

        [Secret("This is some secret")]
        public static void ExposeSecrets()
        {
            Console.WriteLine("⛔️ This shouldn't ever run automatically");
        }

        public static void TerminateSystem()
        {
            Console.WriteLine("❌ This method should not be executed automatically.");
        }
    }
}