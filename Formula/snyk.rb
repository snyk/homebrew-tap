class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.890.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.890.0/snyk-macos"
    sha256 "23278b45d68369b130ce1fb58a2c576e7888e78a244f18463d798a9cee56cc18"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.890.0/snyk-linux"
    sha256 "8f1563ca244d6955855d6921162414cca04b75eb1ec3fef1c97bd9e086ed237b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
