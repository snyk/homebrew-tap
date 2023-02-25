class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1109.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1109.0/snyk-macos"
    sha256 "ee1cfb7f719209bfd5937368cfe20d0010737c8d36d127dcf0eea8471d87784a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1109.0/snyk-linux"
    sha256 "216e53897715a799f1584fef207a74ce2e4dd6a50e5c92751070e78121b593af"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
