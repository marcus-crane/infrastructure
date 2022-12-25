# infrastructure

This repo contains Terraform to power various bits of infra that I use.

At the moment, it has a couple of Cloudflare records as I intend to swap [utf9k](https://github.com/marcus-crane/utf9k) over to Cloudflare Pages (and so I might as well move my DNS setup while there)

I have a couple things deployed on Fly that I might codify using [terraform-provider-fly](https://registry.terraform.io/providers/fly-apps/fly/latest/docs) at some point too

I haven't thought about it too hard

Under the hood, state is kept on Terraform Cloud with a Github action running plans against pull requests and auto applying upon merge to master
