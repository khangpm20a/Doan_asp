using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Eshop.Data;
using Eshop.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Hosting;
using System.Net;
using Microsoft.EntityFrameworkCore.Update;
using System.Security.Principal;

namespace Eshop.Controllers
{
	public class AccountsController : Controller
	{
		private readonly EshopContext _context;
		private readonly IWebHostEnvironment _environment;
		public AccountsController(EshopContext context, IWebHostEnvironment environment)
		{
			_context = context;
			_environment = environment;
		}

		// GET: Accounts
		public async Task<IActionResult> Index()
		{
			var accounts = _context.Accounts.ToList();
			return View(accounts);
		}
        public async Task<IActionResult> Find(string keywork)
        {
            var accounts = _context.Accounts.Where(u=> u.Username.Contains(keywork) || 
			u.FullName.Contains(keywork) || u.Address.Contains(keywork) || u.Email.Contains(keywork) || u.Phone.Contains(keywork))
				.ToList();
            return View("Index",accounts);
        }
        // GET: Accounts/Details/5
        public async Task<IActionResult> Details(int? id)
		{
			if (id == null || _context.Accounts == null)
			{
				return NotFound();
			}

			var account = await _context.Accounts
				.FirstOrDefaultAsync(m => m.Id == id);
			if (account == null)
			{
				return NotFound();
			}

			return View(account);
		}

		public async Task<IActionResult> UserDetails()
		{

			var ID = HttpContext.Session.GetInt32("UserId");
			var account = await _context.Accounts
				.FirstOrDefaultAsync(m => m.Id == ID);


			return View(account);
		}

		// GET: Accounts/Create
		public IActionResult Create()
		{
			return View();
		}
		public IActionResult UserCreate()
		{
			return View();
		}

		// POST: Accounts/Create
		// To protect from overposting attacks, enable the specific properties you want to bind to.
		// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Create([Bind("Id,Username,Password,Email,Phone,Address,FullName,Avatar,IsAdmin,Status")] Account account)
		{
			var accountEx = _context.Accounts.FirstOrDefault(u => u.Username == account.Username);
			if (accountEx != null)
			{
				ViewBag.Er = "Tên username đã được sử dụng!";
				return View();
			}

			if (ModelState.IsValid)
			{
				account.IsAdmin = false;
				account.Status = true;
				account.Avatar = "nor.jpg";
				_context.Add(account);
				await _context.SaveChangesAsync();
				
			}
			return RedirectToAction("Index");
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> UserCreate([Bind("Id,Username,Password,Email,Phone,Address,FullName,Avatar,IsAdmin,Status")] Account account)
		{

			var accountEx = _context.Accounts.FirstOrDefault(u => u.Username == account.Username);
			if (accountEx != null)
			{
				ViewBag.Er = "Tên username đã được sử dụng!";
				return View();
			}
			if (ModelState.IsValid)
			{
				account.IsAdmin = false;
				account.Status = true;
				account.Avatar = "nor.jpg";
				_context.Add(account);

				await _context.SaveChangesAsync();
				return RedirectToAction("Login");
			}
			return View(account);
		}
		// GET: Accounts/Edit/5
		public async Task<IActionResult> Edit(int? id)
		{
			if (id == null || _context.Accounts == null)
			{
				return NotFound();
			}

			var account = await _context.Accounts.FindAsync(id);
			if (account == null)
			{
				return NotFound();
			}
			return View(account);
		}
	
		// POST: Accounts/Edit/5
		// To protect from overposting attacks, enable the specific properties you want to bind to.
		// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Edit(int id, [Bind("Id,Address,Avatar,Phone,Password,Email,FullName,Username,ImageFile")] Account account, IFormFile file)

		{

			var accountEx = _context.Accounts.FirstOrDefault(u => u.Username == account.Username);
			if (accountEx != null)
			{
				ViewBag.Er = "Tên username đã được sử dụng!";
				return View();
			}

			if (id != account.Id)
			{
				return NotFound();
			}
			var accountExit = await _context.Accounts.FindAsync(id);

			if (account.ImageFile != null)
			{
				var fileName = account.Id.ToString() + Path.GetExtension(account.ImageFile.FileName);
				var uploadFolder = Path.Combine(_environment.WebRootPath, "images", "avatar");
				var uploadPath = Path.Combine(uploadFolder, fileName);
				using (FileStream fs = System.IO.File.Create(uploadPath))
				{
					account.ImageFile.CopyTo(fs);
					fs.Flush();
				}
				accountExit.Avatar = fileName;

			}
			accountExit.Status = account.Status;
			accountExit.Username = account.Username;
			accountExit.Email = account.Email;
			accountExit.Address = account.Address;
			accountExit.Phone = account.Phone;
			accountExit.FullName = account.FullName;
			_context.Accounts.Update(accountExit);
			_context.SaveChanges();
			return RedirectToAction("Index");
		}

		public async Task<IActionResult> UserEdit(int? id)
		{

			if (id == null || _context.Accounts == null)
			{
				return NotFound();
			}

			var account = await _context.Accounts.FindAsync(id);
			if (account == null)
			{
				return NotFound();
			}
			return View(account);
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> UserEdit(int id, [Bind("Id,Address,Avatar,Phone,Password,Email,FullName,Username,ImageFile")] Account account, IFormFile file)

		{
			var accountEx = _context.Accounts.FirstOrDefault(u => u.Username == account.Username);
			if (accountEx != null)
			{
				ViewBag.Er = "Tên username đã được sử dụng!";
				return View();
			}
			if (id != account.Id)
			{
				return NotFound();
			}
			var accountExit = await _context.Accounts.FindAsync(id);

			if (account.ImageFile != null)
			{
				var fileName = account.Id.ToString() + Path.GetExtension(account.ImageFile.FileName);
				var uploadFolder = Path.Combine(_environment.WebRootPath, "images", "avatar");
				var uploadPath = Path.Combine(uploadFolder, fileName);
				using (FileStream fs = System.IO.File.Create(uploadPath))
				{
					account.ImageFile.CopyTo(fs);
					fs.Flush();
				}
				accountExit.Avatar = fileName;

			}
			accountExit.Status = account.Status;
			accountExit.Username = account.Username;
			accountExit.Email = account.Email;
			accountExit.Address = account.Address;
			accountExit.Phone = account.Phone;
			accountExit.FullName = account.FullName;
			_context.Accounts.Update(accountExit);
			_context.SaveChanges();
			return RedirectToAction("UserDetails", "Accounts");
		}
		public async Task<IActionResult> Delete(int? id)
		{
			if (id == null || _context.Accounts == null)
			{
				return NotFound();
			}

			var account = await _context.Accounts
				.FirstOrDefaultAsync(m => m.Id == id);
			if (account == null)
			{
				return NotFound();
			}

			return View(account);
		}

		// POST: Accounts/Delete/5
		[HttpPost, ActionName("Delete")]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> DeleteConfirmed(int id)
		{
			if (_context.Accounts == null)
			{
				return Problem("Entity set 'EshopContext.Account'  is null.");
			}
			var account = await _context.Accounts.FindAsync(id);
			if (account != null)
			{

				_context.Accounts.Remove(account);
			}

			await _context.SaveChangesAsync();
			return RedirectToAction(nameof(Index));
		}

		private bool AccountExists(int id)
		{
			return _context.Accounts.Any(e => e.Id == id);
		}
		[HttpGet]
		public IActionResult Login()
		{
			return View();
		}
		[HttpPost]
		public IActionResult Login([Bind("Username,Password")] Account account)
		{
			var accounts = _context.Accounts.FirstOrDefault(a => (account.Username == a.Username && account.Password == a.Password));



			if (accounts != null)
			{

				HttpContext.Session.SetString("User", accounts.FullName);

				HttpContext.Session.SetInt32("UserId", accounts.Id);

				HttpContext.Session.SetString("PhoneUser", accounts.Phone);

				HttpContext.Session.SetString("AddressUser", accounts.Address);
				if (accounts.IsAdmin == true)
				{
					HttpContext.Session.SetString("IdUser", "admin");
					return RedirectToAction("Index", "Admin", "account");
				}

				return RedirectToAction("Index", "Products");
			}
			else
			{
				ViewBag.ErrorMsg = "Login failed!";
				return View();
			}
		}
		public ActionResult Logout()
		{
			HttpContext.Session.Clear();
			return RedirectToAction("Index", "Products");
		}


	}
}
