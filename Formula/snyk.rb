class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.833.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.833.0/snyk-macos"
    sha256 "ba507cb331ef73b1d0f6223d49e6441587fddd7f5e2722de0e4093409d0b0909"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.833.0/snyk-linux"
    sha256 "b8dd8bc5ab007977b074a32f9725728fdc735d14eda89b465e29998ae4b52291"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
