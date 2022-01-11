class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.821.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.821.0/snyk-macos"
    sha256 "fea360f58133c665c1e45ed5bc23df722cc2e269a3c0ae60b95beb01a049e5ff"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.821.0/snyk-linux"
    sha256 "0c7406bc45c69b307459ec5ede2d942587f558eeb5c2cab0efbf28d1e8a169c2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
