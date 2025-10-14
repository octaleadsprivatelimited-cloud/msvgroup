# Vercel Deployment Guide for MSV Group India

## Quick Deploy

### Option 1: Using Vercel CLI (Recommended)

1. **Install Vercel CLI**
   ```bash
   npm install -g vercel
   ```

2. **Login to Vercel**
   ```bash
   vercel login
   ```

3. **Deploy from project directory**
   ```bash
   cd /Users/sri/Downloads/industro-html
   vercel --prod
   ```

### Option 2: Using Vercel Dashboard

1. Go to https://vercel.com
2. Click "Add New Project"
3. Import from GitHub: `octaleadsprivatelimited-cloud/msvgroup`
4. Configure as shown below:
   - **Framework Preset:** Other
   - **Root Directory:** `./` (leave as is)
   - **Build Command:** Leave empty
   - **Output Directory:** `html`
   - **Install Command:** Leave empty

5. Click "Deploy"

---

## Configuration Files Explained

### `vercel.json`
This file tells Vercel:
- ✅ Serve files from the `html/` directory
- ✅ Enable clean URLs (removes .html from URLs)
- ✅ Handle root path `/` to serve `index.html`
- ✅ Set proper caching headers

### `.vercelignore`
Tells Vercel which files to ignore during deployment:
- Documentation files
- Git files
- System files

---

## URL Structure on Vercel

With the current configuration, your URLs will work as:

### ✅ Working URLs (Clean URLs Enabled):
- `https://your-domain.vercel.app/` → index.html
- `https://your-domain.vercel.app/about` → about.html
- `https://your-domain.vercel.app/contact-1` → contact-1.html
- `https://your-domain.vercel.app/services-1` → services-1.html

### ✅ Also Works (With .html):
- `https://your-domain.vercel.app/index.html`
- `https://your-domain.vercel.app/about.html`
- `https://your-domain.vercel.app/contact-1.html`

---

## Troubleshooting

### Issue: 404 Errors
**Cause:** Vercel looking in wrong directory
**Solution:** Ensure `vercel.json` has `"outputDirectory": "html"`

### Issue: Styles Not Loading
**Cause:** CSS paths incorrect
**Solution:** All CSS paths use relative paths (already fixed)

### Issue: Video Not Playing
**Cause:** File size or path issue
**Solution:** Video is optimized and path is correct (`images/msv group/msv00037.mp4`)

### Issue: Clean URLs Not Working
**Cause:** Browser cache
**Solution:** Clear browser cache or open in incognito mode

---

## Environment Variables (If Needed)

If you need to add environment variables:
1. Go to Vercel Dashboard
2. Select your project
3. Go to Settings → Environment Variables
4. Add your variables

---

## Custom Domain Setup

1. Go to Vercel Dashboard
2. Select your project
3. Go to Settings → Domains
4. Add your custom domain (e.g., msvgroupindia.com)
5. Update DNS records as shown by Vercel

---

## Performance Optimization

Already configured in `vercel.json`:
- ✅ Static assets cached for 1 year
- ✅ HTML files revalidated on each request
- ✅ Clean URLs for better SEO
- ✅ Gzip compression (automatic)

---

## Redeployment

### From Git (Automatic)
Every push to the `main` branch will trigger automatic deployment:
```bash
git add .
git commit -m "Your changes"
git push origin main
```

### Manual (Using CLI)
```bash
vercel --prod
```

---

## Vercel Project Settings

Recommended settings in Vercel Dashboard:

### General
- **Framework:** Other
- **Root Directory:** ./
- **Output Directory:** html

### Build & Development
- **Build Command:** (leave empty)
- **Output Directory:** html
- **Install Command:** (leave empty)
- **Development Command:** python3 -m http.server 8080

### Git
- **Production Branch:** main
- **Auto Deploy:** Enabled

---

## Monitoring

View deployment logs:
1. Go to Vercel Dashboard
2. Select your project
3. Click on "Deployments"
4. Click on any deployment to see logs

---

## Cost

- **Free Tier Includes:**
  - Unlimited deployments
  - 100GB bandwidth/month
  - Automatic HTTPS
  - Global CDN
  - DDoS protection

---

## Support

If you encounter issues:
1. Check Vercel documentation: https://vercel.com/docs
2. Check deployment logs in dashboard
3. Verify `vercel.json` configuration
4. Ensure GitHub repository is up to date

---

## Next Steps After Deployment

1. ✅ Add custom domain
2. ✅ Set up Google Analytics
3. ✅ Configure SEO settings
4. ✅ Add sitemap.xml
5. ✅ Set up monitoring alerts

---

## Useful Commands

```bash
# Deploy to production
vercel --prod

# Deploy to preview
vercel

# List deployments
vercel list

# View logs
vercel logs

# Remove deployment
vercel remove [deployment-url]

# Link local project to Vercel
vercel link
```

---

Last Updated: October 15, 2025

