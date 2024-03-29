﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Objects;
using System.Linq.Expressions;

namespace DAL.Repositories
{
    /// <summary>
    /// A generic repository for working with data in the database
    /// </summary>
    /// <typeparam name="T">A POCO that represents an Entity Framework entity</typeparam>
    public class GenericRepository<TEntity> : IRepository<TEntity> where TEntity : class 
    {
        //Fields
        private ObjectContext _context;
        private IObjectSet<TEntity> _objectSet;

        //Constructors
        public GenericRepository()
            : this(new DAL.DataEntities.DataEntities())
        {
        }
        public GenericRepository(ObjectContext context)
        {
            _context = context;
            _objectSet = _context.CreateObjectSet<TEntity>();
        }

        //Methods
        public IQueryable<TEntity> GetQuery()
        {
            return _objectSet;
        }
        public ObjectContext GetContext()
        {
            return _context;
        }
        public IEnumerable<TEntity> GetAll()
        {
            return GetQuery().AsEnumerable();
        }
        public IEnumerable<TEntity> Find(Expression<Func<TEntity, bool>> predicate)
        {
            return _objectSet.Where<TEntity>(predicate);
        }
        public TEntity SingleOrDefault(Expression<Func<TEntity, bool>> predicate)
        {
            return _objectSet.SingleOrDefault<TEntity>(predicate);
        }
        public TEntity FirstOrDefault(Expression<Func<TEntity, bool>> predicate)
        {
            return _objectSet.FirstOrDefault<TEntity>(predicate);
        }
        public void Delete(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException("entity");
            }

            _objectSet.DeleteObject(entity);
        }
        public void Add(TEntity entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException("entity");
            }

            _objectSet.AddObject(entity);
        }
        public void Attach(TEntity entity)
        {
            _objectSet.Attach(entity);
            _context.ObjectStateManager.ChangeObjectState((object)entity, System.Data.EntityState.Modified);
        }

        public void SaveChanges()
        {
            _context.SaveChanges();
        }
        public void SaveChanges(SaveOptions options)
        {
            _context.SaveChanges(options);
            
        }

        public void Dispose()
        {
            _context.Dispose();
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        protected virtual void Dispose(bool disposing)
        {
            //if (disposing)
            //{
            //    if (_context != null)
            //    {
            //        _context.Dispose();
            //        _context = null;
            //    }
            //}
        }
    }

}
