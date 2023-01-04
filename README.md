# licenses.lua

Simple plugin to help you to add a license to your project.

## Configuration

This plugin is configured via two global variables (in this case, this is
prefered over a `setup()` so it works properly with the built-in session
manager):  
- `g:Licenses_name`: Required. The name to autofill in the licenses.  
- `g:Licenses_mail`: Optional. The email address to autofill in the licenses.

## Usage

When you want to insert a license, use the command associated with it. The
commands follow the following rules:  
- License short name with the first letter uppercase (as Neovim requires) and
  the others lowercase. E.g., the MIT License command is `Mit`.  
- Licenses distributed with a version have it's numbers right after the name,
  excluding trailing 0s. E.g., LGPL 2.1 command is `Lgpl21` and LGPL 3.0 is
  `Lgpl3`.  
- Licenses with short versions have a `Brief` variant. E.g., `Lgpl21Brief`,
  `Gpl2Brief`, etc.  
- BSD family licenses commands are: `Bsd2`, `Bsd3` and `Bsd3Clear`.  
- Creative Commons licenses commands are: `CcZero1` and `CcBySa4`.  

To get a comprehensive list of supported licenses, check the folder
`plugin/licenses`. All license files are in the form `LicenseCommand.txt`.

The licenses will be autofilled with the current year, your configured name and
optionally email. Licenses with other stuff to fill (E.g., NCSA requires the
project name) will not have those things filled, so one must fill it manually.

You may specify autofill options on the fly via command arguments. All commands
follow this pattern:

`:Command name year mail`

To skip any of those, you may use an underscore "_". Examples:  
- `Gpl2Brief Chuck\ Norris 1939` will insert a GPL v2.0 short license with the
  name of Chuck Norris and the year of 1939.  
- `Ofl11 _ _ pudim@pudim.com.br` will insert a Open Font License 1.1 with the
  email `pudim@pudim.com.br`.  
- `Mit Harry` will insert a MIT license with the name of Harry.
