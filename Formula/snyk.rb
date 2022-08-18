class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.988.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.988.0/snyk-macos"
    sha256 "a717412e5c951630f494094b173a4c9017f89fabeaf16a80334be639843b8b91"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.988.0/snyk-linux"
    sha256 "e15f78a210caa28045612830587d4eefec8230006afb9aa0abdf0754014bb3c2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
