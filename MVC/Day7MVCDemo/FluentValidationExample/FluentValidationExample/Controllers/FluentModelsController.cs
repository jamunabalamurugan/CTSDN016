using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FluentValidationExample.Models;
using FluentValidation.Results;
using FluentValidationExample.Validation;

namespace FluentValidationExample.Controllers
{
    public class FluentModelsController : Controller
    {
        private FluentContext db = new FluentContext();

        // GET: FluentModels
        public ActionResult Index()
        {
            return View(db.FluentModels.ToList());
        }

        // GET: FluentModels/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FluentModel fluentModel = db.FluentModels.Find(id);
            if (fluentModel == null)
            {
                return HttpNotFound();
            }
            return View(fluentModel);
        }

        // GET: FluentModels/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: FluentModels/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AutoId,FullName,EmailId,DateOfBirth,Age")] FluentModel fluentModel)
        {
            if (ModelState.IsValid)
            {
                db.FluentModels.Add(fluentModel);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(fluentModel);
        }

        // GET: FluentModels/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FluentModel fluentModel = db.FluentModels.Find(id);
            if (fluentModel == null)
            {
                return HttpNotFound();
            }
            return View(fluentModel);
        }

        // POST: FluentModels/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AutoId,FullName,EmailId,DateOfBirth,Age")] FluentModel fluentModel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(fluentModel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(fluentModel);
        }

        // GET: FluentModels/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FluentModel fluentModel = db.FluentModels.Find(id);
            if (fluentModel == null)
            {
                return HttpNotFound();
            }
            return View(fluentModel);
        }

        // POST: FluentModels/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FluentModel fluentModel = db.FluentModels.Find(id);
            db.FluentModels.Remove(fluentModel);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult FluentView(FluentModel model)
        {
            FluentModelValidator validator = new FluentModelValidator();
            ValidationResult result = validator.Validate(model);
            if (result.IsValid)
            {
                // success
                ViewBag.ResultMessage = "Validation successful!";
            }
            else
            {
                foreach (ValidationFailure failure in result.Errors)
                {
                    ModelState.AddModelError(failure.PropertyName,
failure.ErrorMessage);
                }
            }
            return View(model);
        }

    }
}
