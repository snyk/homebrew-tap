class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.313.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.313.1/snyk-macos"
    sha256 "8116d370d1aa786c2c29751e4ee81d3dac44c4c66413225fdd86bb3768f89d9f"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.313.1/snyk-linux"
    sha256 "76a8dd68ee7503de9e0d037c8aa537991a6bf9057c32ab398ff2fd63382f5260"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
