# Hersho Mono - An Open Source Font for Coding

Hersho Mono is an open-source, monospace font designed specifically for the terminal and coding environments. Prioritizing legibility and minimized eye strain, it stands as an experiment to develop a font in the open, akin to software, with the community's collaborative input.

The font was created primarily for the designer's personal use. It stems from his desire to have a font that looks and works exactly the way he wants and that he can modify freely.

It is very much a work in progress. It is currently usable but unfinished. The plan is to push frequent updates, refining and expanding Hersho Mono based on user feedback, emerging use-cases, and evolving vision. Feedback is crucial in shaping its direction.

## Sample

![Font Preview Regular](https://meatcoder.github.io/hersho-mono/HershoMonoNF-Regular.png)

![Font Preview Italic](https://meatcoder.github.io/hersho-mono/HershoMonoNF-Italic.png)

## Downloads

- [HershoMono-Regular.otf](https://meatcoder.github.io/hersho-mono/HershoMono-Regular.otf)
- [HershoMono-Italic.otf](https://meatcoder.github.io/hersho-mono/HershoMono-Italic.otf)
- [HershoMonoNerdFont-Regular.otf](https://meatcoder.github.io/hersho-mono/HershoMonoNerdFont-Regular.otf)
- [HershoMonoNerdFont-Italic.otf](https://meatcoder.github.io/hersho-mono/HershoMonoNerdFont-Italic.otf)

## Design Inspirations

Hersho Mono draws its roots from the pixel-perfect bitmap fonts that graced 1980's personal computers. These fonts, known for their unmistakable charm and simplicity, were emblematic of an era of burgeoning personal computing.

In crafting Hersho Mono, the designer reimagined these classics, stripping them of their serifs while preserving their character and spirit. The result is a modern interpretation that blends old-school computing aesthetics with contemporary design sensibilities. It's a tribute to the past, refined for the needs of today's coders and terminal enthusiasts.

## Features

- **Monospace**: Ideal for terminal and code readability.
- **Latin Characters**: The initial release focuses on Latin characters.
- **Nerd Font Patched**: Incorporates all the nerd font characters ([more info about nerd fonts](https://github.com/ryanoasis/nerd-fonts)).
- **Simple Geometric Forms**: Characters designed using straightforward lines and curves.
- **Minimal Serifs**: Avoids the use of serifs, except where needed for disambiguating similar characters.

## Current Availability

- Regular
- Italic

## Planned Updates

- **Support for Additional Languages**: Open for contributions, especially for Chinese and Japanese characters.
- **Ligatures**: 
  - Legibility-focused spacing tweaks
  - Common programming symbol combinations (currently in progress)
  - Enhanced display of common terminal character combinations
- **Font Variants**:
  - Bold
  - Bold Italic
 
## Download

The latest and previous versions of the OTF font files are available on the [releases page](https://github.com/meatcoder/hersho-mono/releases).

The latest release can always be found here: https://github.com/meatcoder/hersho-mono/releases/latest

Note that the prebult font files are available both in their unpatched variety and one that is patched with the all the nerd fornt characters. The filenames makes it obvious, which is which. It is possibe to download and install both font files, as they have different font family names. 

## License

Hersho Mono, including the font and associated build scripts, is licensed under the MIT License. Please attribute accordingly.

## Contribute

Hersho Mono thrives on the collaboration of the open-source community. Whether you're providing feedback, designing characters, or assisting with ligatures, your contributions are warmly welcomed.

### Contribution Guidelines

1. **Fork the Repository**: Create a copy of the project to your account.
2. **Clone Your Fork**: 
    git clone https://github.com/meatcoder/hersho-mono.git
3. **Create a New Branch**: 
    git checkout -b new-feature-branch
4. **Make Your Changes**: Add or modify the font characteristics.
5. **Push Your Branch**: 
    git push origin new-feature-branch
6. **Open a Pull Request**: Go to the [Hersho Mono repo](https://github.com/meatcoder/hersho-mono) to create a PR.

## Development Notes

This repository has adopted Nix to manage and automatically set up the development environment. This helps ensure a consistent development experience, regardless of the underlying system.

### Authoring the Font

Hersho Mono is crafted using FontForge, a powerful font editor. Once you set up the environment using the steps provided in the subsequent section, FontForge gets automatically installed. For those keen on learning more or exploring advanced features, delve into the [FontForge documentation](https://fontforge.org/docs/).

### Bypassing Nix

While we strongly recommend the use of Nix for an effortless setup, you have the flexibility to bypass it. If you opt for manual setup, ensure the following tools are installed on your system:

- FontForge
- Curl
- Bash

It's important to note that these requirements might evolve over time. For the most up-to-date list of tools and dependencies, always refer to the Nix configuration files in the repository. They serve as the definitive reference.


## Development Environment Setup

To contribute to the development of Hersho Mono, setting up the right environment is crucial.

### 1. Install Nix with Flakes Support

Follow the instructions in the links given below to set up Nix with flakes support:

https://nixos.org/manual/nix/stable/installation/installation

https://nixos.wiki/wiki/Flakes

### 2. Install direnv

Follow the installation instructions for `direnv` for various operating systems [here](https://direnv.net/docs/installation.html).

### 3. Automatic Environment Setup

After installing `direnv` run:

    direnv allow

This ensures the environment is correctly configured each time you enter the project directory.

### 4. Building the Font
    ./scripts/build.sh
Post-build, the resulting OTF font files will be in the `fonts` directory.


## Feedback and Support

Feedback is essential for this evolving project. For suggestions, concerns, or issues, please open a [GitHub issue](https://github.com/meatcoder/hersho-mono/issues).

Together, let's create a font that is truly by and for the community.
