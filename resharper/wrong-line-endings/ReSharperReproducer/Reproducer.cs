//
// This file contains a reproducer for a ReSharper bug.
//

namespace ReSharperReproducer;

public static class Reproducer
{
    public static void Main()
    {
        var someList = new List<int>();

        // Use ".foreach" postfix template to reproduce problem.
        //someList.foreach
    }
}
