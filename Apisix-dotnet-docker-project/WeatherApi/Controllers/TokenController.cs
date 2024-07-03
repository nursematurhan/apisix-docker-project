using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

[ApiController]
[Route("api/[controller]")]
public class TokenController : ControllerBase
{
    [HttpGet]
    public IActionResult GetToken()
    {
        var key = "my_super_secret_key_12345"; 
        var issuer = "apisix";

        var claims = new[]
        {
            new Claim(JwtRegisteredClaimNames.Sub, "user1"), 
            new Claim("key", "user-key"), 
            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
        };

        var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
        var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

        var token = new JwtSecurityToken(issuer,
          issuer,
          claims,
          expires: DateTime.Now.AddMinutes(30),
          signingCredentials: credentials);

        return Ok(new JwtSecurityTokenHandler().WriteToken(token));
    }
}
