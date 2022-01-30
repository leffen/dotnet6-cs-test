var builder = WebApplication.CreateBuilder(args);

var port =Int32.Parse( Environment.GetEnvironmentVariable("PORT") ?? "8080");
var url = $"http://0.0.0.0:{port}";
var target = Environment.GetEnvironmentVariable("TARGET") ?? "World";

builder.WebHost.ConfigureKestrel(options => options.ListenLocalhost(port));
var app = builder.Build();



app.MapGet("/", () => $"Hello {target}");

app.Run();
