class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1167.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1167.0/snyk-macos"
    sha256 "f961dfb085b065f1cea6331dbdf93c11614dc92970115d5248b0724a6a17c4af"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1167.0/snyk-linux"
    sha256 "ced0449566b2d985828054fbd47d821346b7d4f02857d2fa13b46273a2e84119"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
