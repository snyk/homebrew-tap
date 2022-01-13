class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.826.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.826.0/snyk-macos"
    sha256 "b430c40aef74e2d16cd9ccf1ddc9aedddcbec113b99a9fef10956398683f1a49"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.826.0/snyk-linux"
    sha256 "69fa76a6024d692f0a65481bcab3fe580ea07a6e08069e4014e5e25e3dd7827a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
