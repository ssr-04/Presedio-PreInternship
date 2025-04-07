using System;

namespace DevAutomation
{
    [AttributeUsage(AttributeTargets.Method, AllowMultiple =false)]
    public class RunnableAttribute(string description = "No description provided.") : Attribute
    {
        public string Description { get; } = description;
    }
    
    // Just for demo purposes and it has no meaning in real use case
    [AttributeUsage(AttributeTargets.Method, AllowMultiple =false)]
    public class SecretAttribute(String secret = "not defined") : Attribute
    {
        public string Secret { get; } = secret;
    }
}