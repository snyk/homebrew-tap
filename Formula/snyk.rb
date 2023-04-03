class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1135.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1135.0/snyk-macos"
    sha256 "3da71318154ee1a78764d2cadd33844a6ca60ab30399a322a53eeb5ac1f1d4d9"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1135.0/snyk-linux"
    sha256 "492d2d969f856babf9aec3f291650c8b39d0cc113206f2ec61e16c152b01df01"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
