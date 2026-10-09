# Publish both domains

The website source is maintained in this repository. Both domains serve the same
HTML and images, and each domain stays visible in the browser.

- V&S: https://hoechstleistungskiller.v-und-s.de/ — GitHub Pages from `main` in this repository.
- G&P: https://www.hoechstleistungskiller.g-u-p.de/ — Pages workflow in `FlorianGloebl/hoechstleistungskiller-gup`, which checks out a commit from this repository.

After committing changes on `main`, run `./deploy.ps1`. It pushes this repository
and starts the G&P workflow with the exact same commit. A plain `git push` only
updates V&S; use the script for website releases to keep both domains aligned.
If G&P fails after V&S has been pushed, rerun the script to retry the deployment.

Check both repositories' Actions runs, then compare the deployed HTML and images.
The G&P endpoint also exposes `source-version.txt` with its source commit SHA.
The two deployments are separate, so there may be a short difference during a release.

## G&P DNS

At united-domains, use a CNAME for the subdomain `www.hoechstleistungskiller` in the
`g-u-p.de` zone, pointing to `floriangloebl.github.io` (without a protocol or path).
The G&P Pages repository uses `www.hoechstleistungskiller.g-u-p.de` as its custom domain.
Enable enforced HTTPS once GitHub has issued the certificate.
