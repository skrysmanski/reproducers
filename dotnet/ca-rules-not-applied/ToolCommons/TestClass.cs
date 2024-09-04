using System;

namespace ToolCommons;

public static class TestClass
{
    public static int DoSomething(string input)
    {
        try
        {
            var x = new SomethingDisposable();
            return int.Parse(input);
        }
        catch (Exception)
        {
            return -1;
        }
    }
}

public sealed class SomethingDisposable : IDisposable
{
    public void Dispose()
    {

    }
}
