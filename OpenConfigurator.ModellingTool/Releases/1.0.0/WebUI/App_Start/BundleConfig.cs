﻿using System.Web;
using System.Web.Optimization;

namespace ModellingTool
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            // Frameworks
            bundles.Add(new ScriptBundle("~/bundles/frameworks")
                .Include("~/Scripts/Frameworks/*.js"));

            // Plugins (3rd party and custom)
            bundles.Add(new ScriptBundle("~/bundles/plugins")
                .Include("~/Scripts/Plugins/*.js")
                .Include("~/Scripts/CustomPlugins/*.js"));

            // Application
            bundles.Add(new ScriptBundle("~/bundles/application")
                .Include("~/Scripts/Application/*.js"));

            // Css
            bundles.Add(new StyleBundle("~/Content/css").Include("~/Content/site.css"));
        }
    }
}