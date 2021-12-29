class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.811.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.811.0/snyk-macos"
    sha256 "5d1c95f1ee970647e95e0e4059e93c3938597e4e3aba584fcbe46190fcefa4cf"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.811.0/snyk-linux"
    sha256 "6c91dd6df8ad9f417053e20c950850cabe2035707b1cbb8fa306682420a4edab"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
