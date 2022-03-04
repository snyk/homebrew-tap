class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.861.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.861.0/snyk-macos"
    sha256 "6598adb6f23c55888e9a2982f4410588df3a760509b703c4ff363fdc043e1241"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.861.0/snyk-linux"
    sha256 "ebe46b6677e210adaa3dce9105dd28d12b7666eb5c49f37d489f92945926da0c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
