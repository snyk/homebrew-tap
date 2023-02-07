class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1097.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1097.0/snyk-macos"
    sha256 "e0b24678083850de2697050e7204fb99c1c9bf3e454fb6526c123c037f7e4445"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1097.0/snyk-linux"
    sha256 "9321118d26a8749d9cbe5fcc51f95c9a80fe8db31cdd2fdc039ce2c7bdd0a815"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
