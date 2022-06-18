class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.953.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.953.0/snyk-macos"
    sha256 "b891261d728947d74495b768c33a650cd788b171a7b050d787081ffbd1b367d6"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.953.0/snyk-linux"
    sha256 "d21e24dff35c999f1c8c5825187b1a0c3b0a03fdd9ee1f65576f59b5a2e9c2e9"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
