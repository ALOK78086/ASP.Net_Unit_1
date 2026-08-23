<%@ WebService Language="C#" Class="MathService" %>

using System;
using System.Web.Services;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class MathService : System.Web.Services.WebService
{
    [WebMethod(Description = "Adds two numbers")]
    public double Add(double a, double b) { return a + b; }

    [WebMethod(Description = "Subtracts two numbers")]
    public double Sub(double a, double b) { return a - b; }

    [WebMethod(Description = "Multiplies two numbers")]
    public double Mul(double a, double b) { return a * b; }

    [WebMethod(Description = "Divides two numbers")]
    public double Div(double a, double b)
    {
        if (b == 0) throw new DivideByZeroException("Divisor cannot be zero.");
        return a / b;
    }

    [WebMethod(Description = "Returns a greeting")]
    public string Greet(string name) { return "Hello " + name + ", welcome to Web Services !"; }
}
