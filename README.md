# OpenAIPipe

This library provides a UNIX-ey interface to OpenAI.
See [Installation](#installation) and [Setup](#setup) below, but first, some examples.

## Examples

```console
$ ai what is two plus two
Two plus two is equal to four.
```

```console
$ uptime | ai convert this to json
{
        "time_of_measurement": "13:48:26",
        "up_time": "30 days, 18:07",
        "users": 3,
        "load_average": [
                0.46,
                0.61,
                0.79
        ]
}
```

```console
$ ai list the nine planets as JSON | ai convert this to XML but in French | tee planets.fr.xml
<Planètes>
   <Planète>Mercure</Planète>
   <Planète>Vénus</Planète>
   <Planète>La Terre</Planète>
   <Planète>Mars</Planète>
   <Planète>Jupiter</Planète>
   <Planète>Saturne</Planète>
   <Planète>Uranus</Planète>
   <Planète>Neptune</Planète>
   <Planète>Pluton</Planète>
</Planètes>
```

```console
$ curl -sL "https://en.wikipedia.org/wiki/cats" | head -n 5 | ai extract just the title of this webpage | figlet
  ____      _            __        ___ _    _                _ _
 / ___|__ _| |_          \ \      / (_) | _(_)_ __   ___  __| (_) __ _
| |   / _` | __|  _____   \ \ /\ / /| | |/ / | '_ \ / _ \/ _` | |/ _` |
| |__| (_| | |_  |_____|   \ V  V / | |   <| | |_) |  __/ (_| | | (_| |
 \____\__,_|\__|            \_/\_/  |_|_|\_\_| .__/ \___|\__,_|_|\__,_|
                                             |_|
```

```console
$ ls | ai What is this directory for?
This directory contains the source code for a Ruby-based project called openai_pipe. It includes files related to the project's license (LICENSE.txt), changelog (CHANGELOG.md), dependencies (Gemfile and Gemfile.lock), executables (bin and exe), libraries (lib), signature (sig) and tests (spec). There is also a Rakefile and a README.md file which provide information about how to build and install the project, as well as its features and usage. Finally, it includes the openai_pipe-0.1.0.gem and openai_pipe.gemspec files which are used to build the gem which can be installed on other systems.
```

```console
$ ls -l | ai which of these are directories?
bin, exe, lib, sig, spec
```

```console
$ ls | ai "For each of these files, provide a description of what is likely to be their contents?"
bin - Likely contains compiled binary executable files.
CHANGELOG.md - Likely contains a log of changes/modifications, such as bug fixes and new features, that have been made to the project.
exe - Likely contains executable files.
french_planets.xml - Likely contains an XML file containing data related to planets, likely in French.
Gemfile - Likely contains Ruby code for the project's dependencies.
Gemfile.lock - Likely contains a snapshot of the dependencies of the project and versions of those dependencies.
lib - Likely contains the Ruby source code (e.g. classes and modules) for the project.
LICENSE.txt - Likely contains the terms of use/license for the project.
openai_pipe-0.1.0.gem - Likely contains a gem that gathers information from the OpenAI API.
openai_pipe.gemspec - Likely contains configuration details for the gem.
planets.lst - Likely contains a list of planets.
poem.txt - Likely contains a text file containing a poem.
Rakefile - Likely contains Ruby tasks and dependencies that can be used in projects.
README.md - Likely contains general information about the project and usage instructions.
reverse.lst - Likely contains a list of words or items that are in reverse order.
sig - Likely contains digital signatures to validate individual files.
spec - Likely contains Ruby specs (i.e. tests) for the project.
uptime.json - Likely contains a file with information regarding system uptime of a computer.
```

```console
$ git commit -m "$(git status | ai write me a commit message for these changes)"
[master 7d0271f] Add new files and modify README.md
```

```console
$ git status | tee /dev/tty | ai write me a sonnet about the status of this git repository
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        openai_pipe-0.1.0.gem

nothing added to commit but untracked files present (use "git add" to track)

My master branch may lack to thee its kin
For change it holds the only force within
Thé untracked files, they still remain unnamed
‘Tis fervent hope thé change will soon be claimed

Fraught with the choice to leave or to persist
The repository wavers ‘tween future and past
The openai_pipe-0.1.0 gem stands out
Waiting to be added, not yet about

The commit awaits for brave new changes bold
While time’s old force is ever unfurled
Commit forth young mind, furrow not to crawl
From untracked files, a future stands tall.
```

```console
% history | ai what was the last thing I did
The last command you entered was 'history'.
```
n.b. somehow it sees history-esque output and determines that history was typed -- the history command does not itself include the history command in the output.

```console
$ history | ai what was the last thing I did before typing history
The last thing you did was amend a README.md file.
```
n.b. here it determines the amend was for README.md not from the previous command but from ones prior that edited README.md.

```console
$ cat lib/openai_pipe/version.rb | ai rewrite this file with just the minor version incremented | sponge > lib/openai_pipe/version.rb
$ git diff
diff --git a/lib/openai_pipe/version.rb b/lib/openai_pipe/version.rb
index 0f82357..cc57fab 100644
--- a/lib/openai_pipe/version.rb
+++ b/lib/openai_pipe/version.rb
@@ -1,5 +1,5 @@
 # frozen_string_literal: true

 module OpenAIPipe
-  VERSION = "0.1.0"
+  VERSION = "0.1.1"
 end
```

```console
$ ruby -e "$(ai write me a python script that prints the current month | ai translate this into ruby)" | ai translate this into French
Le mois courant est Décembre.
```

## Installation

Install the gem by executing:

    $ gem install openai_pipe

## Setup

This library uses [quick_openai](https://github.com/Aesthetikx/quick_openai') which itself uses [ruby-openai](https://github.com/alexrudall/ruby-openai), so you may want to familiarise yourself with those projects first.

This library uses OpenAI GPT3 to generate responses, so you will need to have your access token available in ENV. In .bashrc or equivalent,
```bash
export OPENAI_ACCESS_TOKEN=mytoken
```

By default the executable is called `openai_pipe`. It is reccommended to alias this command to something shorter in .bashrc or equivalent, e.g.
```bash
alias ai="openai_pipe"
```

## Notes

Be aware that there is a cost associated every time GPT3 is invoked, so be mindful of your account usage. Also be wary of sending sensitive data to OpenAI, and also wary of arbitrarily executing scripts or programs that GPT3 generates.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Aesthetikx/openai_pipe.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
