class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1117.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1117.0/snyk-macos"
    sha256 "b2368ebbe33d1c06eff9118e2162fd15fe042b350cbe122f26f6a9c30004c32e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1117.0/snyk-linux"
    sha256 "c4ca0e68d0fcbc80255bc336d01577f65954672980a5c800e3e7b1bceefbd139"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
