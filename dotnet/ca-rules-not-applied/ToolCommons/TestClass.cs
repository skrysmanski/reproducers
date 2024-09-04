using System;

namespace ToolCommons;

public static class TestClass
{
    public static int DoSomething(string input)
    {
        try
        {
            return int.Parse(input);
        }
        catch (Exception)
        {
            return -1;
        }
    }
}
