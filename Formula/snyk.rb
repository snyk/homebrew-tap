class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1175.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1175.0/snyk-macos"
    sha256 "7c8b50bf9a931c9d7add0940342d07a589a2980e5b536304175440d8d43e7ee9"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1175.0/snyk-linux"
    sha256 "25a4d16ae5ed6317ce7c8a97154958dbef6f7372cb6f71844473eebc22d8626f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
