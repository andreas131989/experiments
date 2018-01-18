# Lighthouse (headless) in a container


## How to Use

## Step 1: Build the image

```
docker build -t adop/lighthouse .
```

## Step 2: Run the container

```
docker run -itv ~/your-local-dir:/home/chrome/reports --cap-add=SYS_ADMIN adop/lighthouse
```

## Step 3: Run Lighthouse with `--chrome-flags`

Once you're in the container, using the `--chrome-flags` option available in lighthouse, we can automatically start Chrome in headless mode within the container light so:

```
lighthouse <URL> --chrome-flags="--headless"
```

After the completion of the tests, the respective report will reside in your local directory (by default in an html file).
