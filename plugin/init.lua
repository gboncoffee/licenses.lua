g = vim.g
v = vim.api

if g.autoloaded_licenses then
    return
end

g.autoloaded_licenses = true

local licenses_dir = debug.getinfo(1).source:match("@?(.*/)") .. "licenses/"

local substitute_placeholders = function(lines, name, year, mail)
    if name == nil or name == "_" then name = g.Licenses_name end
    if year == nil or year == "_" then year = os.date("%Y") end
    if mail == nil or mail == "_" then mail = g.Licenses_mail end
    -- mail can be emtpy
    if not mail then mail = "" end

    for i, line in ipairs(lines) do
        local newstr = line
        newstr = string.gsub(newstr, "<name>", name)
        newstr = string.gsub(newstr, "<year>", year)
        newstr = string.gsub(newstr, "<mail>", mail)
        lines[i] = newstr
    end

    return lines
end

local read_license = function(license)
    local file = io.open(licenses_dir .. license .. ".txt")
    if not file then
        v.nvim_err_write("Cannot read license file! It should be distributed alonside the plugin. Please check the local repo for corruption!")
        return ""
    end
    local lines = {}
    for line in file:lines() do
        table.insert(lines, line)
    end
    return lines
end

local command = function(cmd, license)
    v.nvim_create_user_command(cmd, function(a)
        vim.fn.append(
            vim.fn.getcurpos()[2] - 1, substitute_placeholders(
                read_license(cmd),
                a.fargs[1],
                a.fargs[2],
                a.fargs[3]
            )
        )
    end, {
        nargs = "*",
    })
end

-- Academic Free License 3.0
command("Afl3")

-- Apache License 2.0
command("Apache2")

-- Artistic License 2.0
command("Artistic2")

-- Boost Software License 1.0
command("Bsl1")

-- BSD
command("Bsd2")
command("Bsd3")
command("Bsd3Clear")

-- Creative Commons
command("CcZero1")
command("CcBy4")
command("CcBySa4")

-- Do What The F*ck You Want To Public License
command("Wtfpl")

-- Educational Community License 2.0
command("Ecl2")
command("Ecl2Brief")

-- Eclipse Public License
command("Epl1")
command("Epl2")

-- European Union Public License 1.1
command("Eupl11")

-- GNU Affero General Public License v3.0
command("Agpl3")
command("Agpl3Brief")

-- GNU General Public License
command("Gpl2")
command("Gpl2Brief")
command("Gpl3")
command("Gpl3Brief")

-- GNU Lesser General Public License
command("Lgpl21")
command("Lgpl21Brief")
command("Lgpl3")

-- ISC
command("Isc")

-- LaTeX Project Public License v1.3c
command("Lppl13c")
command("Lppl13cBrief")

-- Microsoft Public License
command("Mspl")

-- MIT License
command("Mit")

-- Mozilla Public License 2.0
command("Mpl2")

-- Open Software License 3.0
command("Osl3")

-- PostgreSQL License
command("PostgreSQL")

-- SIL Open Font License 1.1
command("Ofl11")

-- University of Illinois/NCSA Open Source License
--
-- This one will not automatically place the project name. One should remember
-- to place it accordinly when using it
command("Ncsa")

-- The Unlicense
command("Unlicense")

-- zlib License
command("Zlib")
