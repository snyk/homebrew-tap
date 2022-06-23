class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.956.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.956.0/snyk-macos"
    sha256 "203f9d10491a3f6c1fcaf0ff58fbb299388db36c7bc14f5cdbd7eb35426fed4c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.956.0/snyk-linux"
    sha256 "c5eff01c546cc1581513bc2a5aebf97b0cf4316d542d8b00e7079425e57e64ca"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
