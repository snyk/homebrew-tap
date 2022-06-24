class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.958.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.958.0/snyk-macos"
    sha256 "b8477178c4c5a52369709ec83100536959a667f3bb1e83797f3c17556e2e1d8e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.958.0/snyk-linux"
    sha256 "3f84ea459a0aee33cf62edbd518b4d3b98122639b8b9ebcbe8520bc338603959"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
