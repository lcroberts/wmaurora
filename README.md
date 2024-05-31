# wmaurora

[![build-wmaurora](https://github.com/lcroberts/wm-ublue-derivatives/actions/workflows/build_wmaurora.yml/badge.svg)](https://github.com/lcroberts/wm-ublue-derivatives/actions/workflows/build_wmaurora.yml)

# Purpose

This branch of the repo is intended to be a personal derivative of [Aurora](https://getaurora.dev/) and is built from the template found [here](https://github.com/ublue-os/image-template). It has added window manager stuff on top of the existing Aurora image to make it fit my workflow out of the box. It also includes some other features that I need such as Japanese input and some theming utilities. There is also a branch that serves as a derivative of [Bazzite.](https://bazzite.gg/)

# How to Use

## Installing

This repository does not generate installer ISOs so the first step is to download an ISO from the [Aurora](https://getaurora.dev/) home page.

After you go through the installation process you can the run the following commands:

```bash
rpm-ostree reset
rpm-ostree rebase ostree-unverified-registry:ghcr.io/lcroberts/wmaurora:latest
```

It is recommended to avoid going through the post install getting started app before rebasing, so you can close that out and rerun it after the rebase.

If you are rebasing from an unrelated image such as kinoite you can also run the following command after the rebase to get the flatpaks included in the aurora installer.

```bash
ujust _install-system-flatpaks
```

## Verify

The image can be verified using cosign and the public key in the repository root.

```bash
cosign verify --key cosign.pub ghcr.io/lcroberts/wmaurora
```
