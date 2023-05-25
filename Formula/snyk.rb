class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1163.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1163.0/snyk-macos"
    sha256 "ad9576fc0a8e05d51e9dfd59a55e47ca1210c569c4fe08d8efd9b85242c3f1b7"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1163.0/snyk-linux"
    sha256 "7d635f0c439178d7694d894ed6314b1e5238a59e7b7af70363b34dcde6c1b06b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
