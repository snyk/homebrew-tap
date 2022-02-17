class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.854.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.854.0/snyk-macos"
    sha256 "49a9bd215688be78b8fd64300f2f571128c0f410ba79c661fd7346b79b72dd3e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.854.0/snyk-linux"
    sha256 "e5e62bbeda9b04ab8ee60985caead5b2067cde30cdbc6a86843006a3e6fb8fb3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
